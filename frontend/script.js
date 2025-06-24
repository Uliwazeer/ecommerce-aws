fetch("https://3ea5oj0bgd.execute-api.us-east-1.amazonaws.com/visitor")
  .then(res => res.json())
  .then(data => {
    document.getElementById('visitor-count').innerText = '👁️ Visitors: ' + data.count;
  })
  .catch(err => {
    document.getElementById('visitor-count').innerText = '👁️ Visitors: Error';
  });

fetch('http://your-ecs-app-endpoint/api/products')
  .then(res => res.json())
  .then(products => {
    const list = document.getElementById('product-list');
    products.forEach(p => {
      const div = document.createElement('div');
      div.className = 'product-card';
      div.innerHTML = `<h3>${p.name}</h3><p>💵 $${p.price}</p>`;
      list.appendChild(div);
    });
  })
  .catch(err => console.error('Failed to load products', err));
