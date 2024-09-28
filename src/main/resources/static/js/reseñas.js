document.querySelector('.review-form').addEventListener('submit', function (e) {
    e.preventDefault();

    const reviewText = e.target.querySelector('textarea').value;
    const ratingValue = e.target.querySelector('#rating').value;

    // Aquí podrías enviar los datos a tu servidor o almacenarlos
    console.log('Reseña:', reviewText, 'Calificación:', ratingValue);

    // Limpia el formulario después de enviar
    e.target.reset();
});
