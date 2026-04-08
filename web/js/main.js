// FashOn Website JavaScript

document.addEventListener('DOMContentLoaded', () => {
  initNavigation();
  initProgressDemo();
  initChips();
  initLoginTabs();
  initSearchDemo();
  initProgressAnimation();
});

// ===== NAVIGATION =====
function initNavigation() {
  const navLinks = document.querySelectorAll('[data-page]');
  const sections = document.querySelectorAll('.page-section');

  function showPage(pageId) {
    sections.forEach(s => s.classList.remove('active'));
    navLinks.forEach(l => l.classList.remove('active'));

    const target = document.getElementById(pageId);
    if (target) target.classList.add('active');

    navLinks.forEach(l => {
      if (l.dataset.page === pageId) l.classList.add('active');
    });

    window.scrollTo({ top: 0, behavior: 'smooth' });
    history.pushState({ page: pageId }, '', '#' + pageId);
  }

  navLinks.forEach(link => {
    link.addEventListener('click', e => {
      e.preventDefault();
      showPage(link.dataset.page);
    });
  });

  // Handle initial hash
  const hash = window.location.hash.replace('#', '');
  showPage(hash || 'home');

  // Expose globally
  window.showPage = showPage;
}

// ===== PROGRESS DEMO =====
function initProgressDemo() {
  let progress = 0;
  let animating = false;

  const fillEl = document.querySelector('.progress-fill');
  const pctEl = document.querySelector('.progress-pct');

  function startProgress() {
    if (animating) return;
    animating = true;
    progress = 0;

    const interval = setInterval(() => {
      progress += Math.random() * 4 + 1;
      if (progress >= 100) {
        progress = 100;
        clearInterval(interval);
        animating = false;
        setTimeout(() => {
          progress = 0;
          if (fillEl) fillEl.style.width = '0%';
          if (pctEl) pctEl.textContent = '0%';
        }, 2000);
      }
      if (fillEl) fillEl.style.width = progress + '%';
      if (pctEl) pctEl.textContent = Math.round(progress) + '%';
    }, 80);
  }

  const tryOnBtn = document.querySelector('.start-try-on-btn');
  if (tryOnBtn) tryOnBtn.addEventListener('click', startProgress);

  // Auto-start on page load
  setTimeout(startProgress, 1500);
}

// ===== CHIPS =====
function initChips() {
  document.querySelectorAll('.chips-row').forEach(row => {
    row.querySelectorAll('.chip').forEach(chip => {
      chip.addEventListener('click', () => {
        row.querySelectorAll('.chip').forEach(c => c.classList.remove('active'));
        chip.classList.add('active');
      });
    });
  });
}

// ===== LOGIN TABS =====
function initLoginTabs() {
  const tabs = document.querySelectorAll('.tab-btn');
  tabs.forEach(tab => {
    tab.addEventListener('click', () => {
      tabs.forEach(t => t.classList.remove('active'));
      tab.classList.add('active');
    });
  });
}

// ===== SEARCH DEMO =====
function initSearchDemo() {
  const searchInput = document.querySelector('.search-input-web');
  const searchBtn = document.querySelector('.search-btn');
  const productsGrid = document.querySelector('.products-grid');

  const products = [
    { name: "Women's T-Shirt", price: "$24.99", img: "search_result_shirt.png" },
    { name: "Summer Dress", price: "$49.99", img: "try_on_result.png" },
    { name: "Casual Outfit", price: "$38.99", img: "my_page.png" },
    { name: "Spring Collection", price: "$55.00", img: "search_result_shirt.png" },
  ];

  function renderProducts(items) {
    if (!productsGrid) return;
    productsGrid.innerHTML = items.map(p => `
      <div class="product-card" onclick="window.showPage('try-on')">
        <img src="assets/images/${p.img}" alt="${p.name}" loading="lazy">
        <div class="product-card-info">
          <span class="product-name">${p.name}</span>
          <span class="product-price">${p.price}</span>
        </div>
      </div>
    `).join('');
  }

  if (productsGrid) renderProducts(products);

  if (searchBtn) {
    searchBtn.addEventListener('click', () => {
      const q = searchInput?.value.toLowerCase().trim();
      if (!q) { renderProducts(products); return; }
      const filtered = products.filter(p =>
        p.name.toLowerCase().includes(q)
      );
      renderProducts(filtered.length ? filtered : products);
    });
  }

  if (searchInput) {
    searchInput.addEventListener('keydown', e => {
      if (e.key === 'Enter') searchBtn?.click();
    });
  }
}

// ===== PROGRESS ANIMATION (try-on page) =====
function initProgressAnimation() {
  const observer = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const fill = entry.target.querySelector('.progress-fill');
        if (fill && fill.dataset.animated !== 'true') {
          fill.dataset.animated = 'true';
          fill.style.width = '0%';
          setTimeout(() => { fill.style.width = '55%'; }, 300);
        }
      }
    });
  }, { threshold: 0.3 });

  document.querySelectorAll('.progress-demo').forEach(el => observer.observe(el));
}

// ===== SCROLL ANIMATIONS =====
const animObserver = new IntersectionObserver(entries => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.style.opacity = '1';
      entry.target.style.transform = 'translateY(0)';
    }
  });
}, { threshold: 0.1 });

document.querySelectorAll('.feature-card, .product-card, .stat-card').forEach(el => {
  el.style.opacity = '0';
  el.style.transform = 'translateY(20px)';
  el.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
  animObserver.observe(el);
});
