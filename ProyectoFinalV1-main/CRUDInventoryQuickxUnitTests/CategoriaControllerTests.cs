using CRUDInventoryQuick.Contracts;
using CRUDInventoryQuick.Controllers;
using CRUDInventoryQuick.Models;
using Microsoft.AspNetCore.Mvc;
using Moq;

namespace CRUDInventoryQuickxUnitTests
{
    public class CategoriaControllerTests
    {
        private readonly Mock<IRepository<CATEGORIum>> _mockRepository;
        private readonly CategoriaController _controller;

        public CategoriaControllerTests()
        {
            _mockRepository = new Mock<IRepository<CATEGORIum>>();
            _controller = new CategoriaController(_mockRepository.Object);
        }


        [Fact]
        public void Index_ActionExecutes_ReturnsViewForIndex()
        {
            var result = _controller.Index();
            Assert.IsType<Task<IActionResult>>(result);
        }

        [Fact]
        public void Index_ActionExecutes_ReturnsExactNumberOfCategories()
        {
            _mockRepository.Setup(m => m.GetAll())
                .ReturnsAsync(new List<CATEGORIum>() { new CATEGORIum(), new CATEGORIum(), new CATEGORIum() });

            var result = _controller.Index();
            var iActionResult = Assert.IsType<Task<IActionResult>>(result);
            var categories = Assert.IsType<List<CATEGORIum>>(iActionResult.Result).Count; // Revisar
            Assert.Equal(3, categories);
        }
    }
}