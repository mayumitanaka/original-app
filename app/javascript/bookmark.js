function bookmarkBtn() {
  const bookmark = document.getElementById('bookmark-btn');
  const markDone = "登録済み"
  const markRemove = "お気に入り"
  bookmark.addEventListener("click", () => {
    if (bookmark.getAttribute("style") == "background-color:#FFBEDA;") {
      bookmark.removeAttribute("style")
      bookmark.innerHTML = markRemove
    } else {
      bookmark.setAttribute("style", "background-color:#FFBEDA;")
      bookmark.innerHTML = markDone
    }
  })
}

window.addEventListener('load', bookmarkBtn)