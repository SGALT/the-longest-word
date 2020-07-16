function tagsBarToggler(){
  const toggler = document.querySelector(".navbar-toggler")
  const elements = document.querySelector(".best-score-element")
  toggler.addEventListener('click', event => {
    elements.classList.toggle("hidden")
  })
}

export { tagsBarToggler }
