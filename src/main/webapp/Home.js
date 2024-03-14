const Data = [
    { cover: 'https://websitedemos.net/creative-blog-02/wp-content/uploads/sites/916/2022/03/advertising-category.jpg', title: 'Technology', description: 'Description for Card 1' },
    { cover: './assests/sports.jpg', title: 'Sports', description: 'Description for Card 2' },
    { cover: './assests/travel.jpg', title: 'Travel', description: 'Description for Card 3' },
    { cover: 'https://websitedemos.net/creative-blog-02/wp-content/uploads/sites/916/2022/03/film-category.jpg', title: 'Film', description: 'Description for Card 3' }
];

function createCard({ cover, title, description }) {
    const card = document.createElement('div');
    card.className = 'col-md-3';

    card.innerHTML = `
    <div class="card mb-4" style="border: none;" >
    <img src="${cover}" style="border-radius: 26px;" class="card-img-top"  alt="${title}">
    <div class="card-body">
        <h5 class="card-title text-center">${title}</h5>
    </div>
</div>

    `;

    return card;
}

const cardContainer = document.getElementById('card-container');

Data.forEach(item => {
    const card = createCard(item);
    cardContainer.appendChild(card);
});
