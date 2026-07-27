using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Repository;
using IHunger.Domain.Models;
using Moq;
using Xunit;

namespace IHunger.Service.Test
{
    public class CommentServiceTest
    {
        private readonly Mock<ICommentRepository> _commentRepoMock;
        private readonly Mock<IRestaurantRepository> _restaurantRepoMock;
        private readonly Mock<INotifier> _notifierMock;
        private readonly CommentService _service;

        public CommentServiceTest()
        {
            _commentRepoMock = new Mock<ICommentRepository>();
            _restaurantRepoMock = new Mock<IRestaurantRepository>();
            _notifierMock = new Mock<INotifier>();
            _service = new CommentService(_notifierMock.Object, _commentRepoMock.Object, _restaurantRepoMock.Object);
        }

        private Comment CreateValidComment()
        {
            return new Comment
            {
                Id = Guid.NewGuid(),
                IdRestaurant = Guid.NewGuid(),
                Description = "Great food!",
                Starts = 5,
                CreatedAt = DateTime.Now
            };
        }

        [Fact(DisplayName = "GetById returns comment")]
        [Trait("CommentServiceTest", "Comment Service Tests")]
        public async Task GetById_ReturnsComment()
        {
            var comment = CreateValidComment();
            _commentRepoMock.Setup(r => r.GetById(comment.IdRestaurant, comment.Id)).ReturnsAsync(comment);

            var result = await _service.GetById(comment.IdRestaurant, comment.Id);

            Assert.NotNull(result);
            Assert.Equal(comment.Id, result.Id);
        }

        [Fact(DisplayName = "Create valid comment succeeds")]
        [Trait("CommentServiceTest", "Comment Service Tests")]
        public async Task Create_ValidComment_Succeeds()
        {
            var comment = CreateValidComment();
            var restaurant = new Restaurant { Id = comment.IdRestaurant, CreatedAt = DateTime.Now };

            _restaurantRepoMock.Setup(r => r.GetById(comment.IdRestaurant)).ReturnsAsync(restaurant);
            _commentRepoMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.Create(comment);

            Assert.NotNull(result);
            _commentRepoMock.Verify(r => r.Add(It.IsAny<Comment>()), Times.Once);
        }

        [Fact(DisplayName = "Create comment with invalid restaurant notifies error")]
        [Trait("CommentServiceTest", "Comment Service Tests")]
        public async Task Create_InvalidRestaurant_NotifiesError()
        {
            var comment = CreateValidComment();
            _restaurantRepoMock.Setup(r => r.GetById(It.IsAny<Guid>())).ReturnsAsync((Restaurant)null);

            var result = await _service.Create(comment);

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }

        [Fact(DisplayName = "Update existing comment succeeds")]
        [Trait("CommentServiceTest", "Comment Service Tests")]
        public async Task Update_ExistingComment_Succeeds()
        {
            var comment = CreateValidComment();
            var existing = CreateValidComment();
            existing.Id = comment.Id;
            existing.IdRestaurant = comment.IdRestaurant;

            _commentRepoMock.Setup(r => r.GetById(comment.IdRestaurant, comment.Id)).ReturnsAsync(existing);
            _commentRepoMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.Update(comment);

            Assert.NotNull(result);
            _commentRepoMock.Verify(r => r.Update(It.IsAny<Comment>()), Times.Once);
        }

        [Fact(DisplayName = "Update non-existing comment notifies error")]
        [Trait("CommentServiceTest", "Comment Service Tests")]
        public async Task Update_NonExistingComment_NotifiesError()
        {
            var comment = CreateValidComment();
            _commentRepoMock.Setup(r => r.GetById(comment.IdRestaurant, comment.Id)).ReturnsAsync((Comment)null);

            var result = await _service.Update(comment);

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }

        [Fact(DisplayName = "Delete existing comment succeeds")]
        [Trait("CommentServiceTest", "Comment Service Tests")]
        public async Task Delete_ExistingComment_Succeeds()
        {
            var comment = CreateValidComment();
            _commentRepoMock.Setup(r => r.GetById(comment.IdRestaurant, comment.Id)).ReturnsAsync(comment);
            _commentRepoMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.Delete(comment.IdRestaurant, comment.Id);

            Assert.NotNull(result);
            _commentRepoMock.Verify(r => r.Remove(comment.Id), Times.Once);
        }

        [Fact(DisplayName = "Delete non-existing comment notifies error")]
        [Trait("CommentServiceTest", "Comment Service Tests")]
        public async Task Delete_NonExistingComment_NotifiesError()
        {
            _commentRepoMock.Setup(r => r.GetById(It.IsAny<Guid>(), It.IsAny<Guid>())).ReturnsAsync((Comment)null);

            var result = await _service.Delete(Guid.NewGuid(), Guid.NewGuid());

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }
    }
}
