let Hooks = {};

Hooks.BoldToggle = {
	mounted() {
		this.el.addEventListener("click", (e) => {
			let counterText = document.getElementById("counter-text");
			if (counterText.style.fontWeight === "bold") {
				counterText.style.fontWeight = "normal";
			} else {
				counterText.style.fontWeight = "bold";
			}
		});
	},
};

export default Hooks;
