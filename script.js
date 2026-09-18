// ===== STATE =====
let cart = [];

// ===== HELPERS =====
function $(id) { return document.getElementById(id); }

function showToast(message) {
  const toast = $('toast');
  toast.textContent = message;
  toast.classList.add('show');
  setTimeout(() => toast.classList.remove('show'), 2500);
}

function openModal(id) {
  $(id).classList.add('open');
}

function closeModal(id) {
  $(id).classList.remove('open');
}

function closeAllModals() {
  document.querySelectorAll('.modal-overlay').forEach(m => m.classList.remove('open'));
}

// ===== SMOOTH SCROLL (nav links) =====
document.querySelectorAll('[data-scroll]').forEach(link => {
  link.addEventListener('click', (e) => {
    e.preventDefault();
    const target = document.querySelector(link.getAttribute('href'));
    if (target) target.scrollIntoView({ behavior: 'smooth' });
  });
});

// ===== HERO BUTTONS =====
$('verCatalogoBtn').addEventListener('click', () => {
  document.getElementById('productos').scrollIntoView({ behavior: 'smooth' });
});

$('registrarseBtn').addEventListener('click', () => {
  openModal('registerModal');
});

// ===== HEADER BUTTONS =====
$('loginBtn').addEventListener('click', () => openModal('loginModal'));

$('userBtn').addEventListener('click', () => openModal('loginModal'));

$('cartBtn').addEventListener('click', () => {
  renderCart();
  openModal('cartModal');
});

// ===== VER TODOS =====
$('verTodosBtn').addEventListener('click', (e) => {
  e.preventDefault();
  document.getElementById('productos').scrollIntoView({ behavior: 'smooth' });
  showToast('Mostrando todos los productos destacados');
});

// ===== CTA BUTTON =====
$('crearCuentaBtn').addEventListener('click', () => openModal('registerModal'));

// ===== MODAL CLOSE (X buttons + click outside) =====
document.querySelectorAll('[data-close]').forEach(btn => {
  btn.addEventListener('click', () => closeAllModals());
});

document.querySelectorAll('.modal-overlay').forEach(overlay => {
  overlay.addEventListener('click', (e) => {
    if (e.target === overlay) closeAllModals();
  });
});

document.addEventListener('keydown', (e) => {
  if (e.key === 'Escape') closeAllModals();
});

// ===== SWITCH BETWEEN LOGIN / REGISTER =====
$('switchToRegister').addEventListener('click', (e) => {
  e.preventDefault();
  closeModal('loginModal');
  openModal('registerModal');
});

$('switchToLogin').addEventListener('click', (e) => {
  e.preventDefault();
  closeModal('registerModal');
  openModal('loginModal');
});

// ===== LOGIN FORM =====
$('loginForm').addEventListener('submit', (e) => {
  e.preventDefault();
  closeAllModals();
  showToast('Sesión iniciada correctamente ✅');
  e.target.reset();
});

// ===== REGISTER FORM =====
$('registerForm').addEventListener('submit', (e) => {
  e.preventDefault();
  closeAllModals();
  showToast('Cuenta creada con éxito 🎉');
  e.target.reset();
});

// ===== ADD TO CART =====
document.querySelectorAll('.btn-add-cart').forEach(btn => {
  btn.addEventListener('click', () => {
    const card = btn.closest('.product-card');
    const name = card.dataset.name;
    const price = parseFloat(card.dataset.price);

    const existing = cart.find(item => item.name === name);
    if (existing) {
      existing.qty += 1;
    } else {
      cart.push({ name, price, qty: 1 });
    }

    updateCartBadge();
    showToast(`${name} añadido al carrito`);
  });
});

function updateCartBadge() {
  const totalItems = cart.reduce((sum, item) => sum + item.qty, 0);
  $('cartBadge').textContent = totalItems;
}

function renderCart() {
  const list = $('cartList');
  const totalDiv = $('cartTotal');
  list.innerHTML = '';

  if (cart.length === 0) {
    list.innerHTML = '<li class="cart-empty">Tu carrito está vacío</li>';
    totalDiv.textContent = '';
    return;
  }

  let total = 0;
  cart.forEach((item, index) => {
    total += item.price * item.qty;
    const li = document.createElement('li');
    li.className = 'cart-item';
    li.innerHTML = `
      <span class="cart-item-name">${item.name}</span>
      <span class="cart-item-qty">x${item.qty}</span>
      <span class="cart-item-price">$${(item.price * item.qty).toFixed(2)}</span>
      <button class="cart-item-remove" data-index="${index}">✕</button>
    `;
    list.appendChild(li);
  });

  totalDiv.textContent = `Total: $${total.toFixed(2)}`;

  // remove buttons
  list.querySelectorAll('.cart-item-remove').forEach(btn => {
    btn.addEventListener('click', () => {
      cart.splice(parseInt(btn.dataset.index), 1);
      updateCartBadge();
      renderCart();
    });
  });
}

// ===== CHECKOUT =====
$('checkoutBtn').addEventListener('click', () => {
  if (cart.length === 0) {
    showToast('Tu carrito está vacío');
    return;
  }
  cart = [];
  updateCartBadge();
  renderCart();
  closeAllModals();
  showToast('¡Compra realizada con éxito! 🛒✅');
});
