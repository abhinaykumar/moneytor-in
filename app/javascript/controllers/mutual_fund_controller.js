import { Controller } from "stimulus"

export default class extends Controller {
    // static targets = ["name"]
    // initialize() {
    //     console.log(this.nameTarget)
    // }
    connect() {
        document.addEventListener('autocomplete.change', function(e) {
            const { value, textValue } = e.detail
            document.getElementById('search-fund-card').classList.remove('invisible');
            document.getElementById('search-fund-name').innerText = textValue
            let searchTerm = "https://www.google.com/search?q=nav+of+" + textValue.replace(/ /g, "+");
            document.getElementById("google-fund-nav").href = searchTerm

        })
    }
}