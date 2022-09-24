using CRUDInventoryQuick.Contracts;
using CRUDInventoryQuick.Controllers;
using CRUDInventoryQuick.Models;
using Microsoft.AspNetCore.Mvc;
using Moq;
using ViewResult = Microsoft.AspNetCore.Mvc.ViewResult;

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
        public async Task Index_ActionExecutes_ReturnsViewForIndex()
        {
            var result = _controller.Index();
            await Assert.IsType<Task<IActionResult>>(result);
        }

        [Fact]
        public async Task Index_ActionExecutes_ReturnsExactNumberOfCategories()
        { 
            _mockRepository.Setup(r => r.GetAll())
                .ReturnsAsync(new List<CATEGORIum>() { new CATEGORIum(), new CATEGORIum(), new CATEGORIum(), new CATEGORIum() });

            var result =  await _controller.Index();

            var viewResult = Assert.IsType<ViewResult>(result);
            var categories = Assert.IsType<List<CATEGORIum>>(viewResult.Model);
            Assert.Equal(4, categories.Count);
           
        }
    }
}