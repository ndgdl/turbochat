import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "results"]

  connect() {
    console.log("Shit boyyyy")
    console.log(this.resultsTarget)
    console.log(this.inputTarget)
  }

  displayResults() {
    this.resultsTarget.classList.remove("d-none")
  }
  hideResults() {
    this.resultsTarget.classList.add("d-none")
  }
}
