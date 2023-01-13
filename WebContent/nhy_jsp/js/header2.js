const toggleBtn = document.querySelector('.navbar_togleBtn');
const menu = document.querySelector('.navbar_menu');
const icons = document.querySelector('.navbar_icons');
const login = document.querySelector('.navbar_login');

toggleBtn.addEventListener('click', () => {
	menu.classList.toggle('active');
	icons.classList.toggle('active');
	login.classList.toggle('active');
});	