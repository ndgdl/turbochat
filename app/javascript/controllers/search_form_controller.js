import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "results"]

  displayResults() {
    if (this.inputTarget.value === "") {
      this.resultsTarget.classList.remove("d-none")
    }
    else {
      this.resultsTarget.classList.remove("d-none")
    }
  }
  // hideResults() {
  //   this.resultsTarget.classList.add("d-none")
  // }
}
