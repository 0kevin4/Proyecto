using CRUDInventoryQuick.Contracts;
using CRUDInventoryQuick.Controllers;
using CRUDInventoryQuick.Models;
using Microsoft.AspNetCore.Mvc;
using Moq;
using Twilio.TwiML.Voice;
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
        public async void Index_ActionExecutes_ReturnsViewForIndex()
        {
            var result = await _controller.Index();
            Assert.IsType<ViewResult>(result);
        }

        [Fact]
        public async void Index_ActionExecutes_ReturnsExactNumberOfCategories()
        {
            _mockRepository.Setup(r => r.GetAll())
                .ReturnsAsync(new List<CATEGORIum>() { new CATEGORIum(), new CATEGORIum(), new CATEGORIum(), new CATEGORIum() });

            var result = await _controller.Index();

            var viewResult = Assert.IsType<ViewResult>(result);
            var categories = Assert.IsType<List<CATEGORIum>>(viewResult.Model);
            Assert.Equal(4, categories.Count);

        }

        [Fact]
        public void Create_ActionExecutes_ReturnsViewCreate()
        {

            var result = _controller.Create();
            Assert.IsType<ViewResult>(result);
        }

        [Fact]
        public async void Create_invalidModelState_ReturnsView()
        {
            _controller.ModelState.AddModelError("Nombre", "El nombre es Requerido");
            var Categoria = new CATEGORIum { CategoriaId = 100, Estado = true };

            var result = await _controller.Create(Categoria);

            var viewResult = Assert.IsType<ViewResult>(result);
            var testCategoria = Assert.IsType<CATEGORIum>(viewResult.Model);

            Assert.Equal(Categoria.CategoriaId, testCategoria.CategoriaId);
            Assert.Equal(Categoria.Estado, testCategoria.Estado);
        }

        [Fact]
        public async void Create_InvalidModelState_CreateEmployeeNeverExecutes()
        {
            _controller.ModelState.AddModelError("Name", "Name is required");
            var employee = new CATEGORIum { CategoriaId = 34 };

            await _controller.Create(employee);

            _mockRepository.Verify(x => x.Add(It.IsAny<CATEGORIum>()), Times.Never);

        }

        [Fact]
        public async void Create_ModelStateValid_CreateEmployeeCalledOnce()
        {
            CATEGORIum cat = null;
            _mockRepository.Setup(r => r.Add(It.IsAny<CATEGORIum>()))
            .Callback<CATEGORIum>(x => cat = x);
            var categoria = new CATEGORIum
            {
                CategoriaId = 100,
                Estado = true,
                Nombre = "Kevin"
            };
            await _controller.Create(categoria);

            _mockRepository.Verify(x => x.Add(It.IsAny<CATEGORIum>()), Times.Once);
            Assert.Equal(cat.CategoriaId, categoria.CategoriaId);
            Assert.Equal(cat.Estado, categoria.Estado);
            Assert.Equal(cat.Nombre, categoria.Nombre);
        }

        [Fact]
        public async void Create_ActionExecuted_RedirectsToIndexAction()
        {
            var categoria = new CATEGORIum
            {
                CategoriaId = 100,
                Estado = true,
                Nombre = "Kevin"
            };
            var result = await _controller.Create(categoria);

            var redirectToActionResult = Assert.IsType<RedirectToActionResult>(result);
        }


    }
}