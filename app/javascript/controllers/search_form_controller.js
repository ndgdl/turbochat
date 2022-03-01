import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "input", "results"]

  search() {
    clearTimeout(this.timeout);
    this.timeout = setTimeout(() => {
      if (this.inputTarget.value === "") {
        this.resultsTarget.classList.add("d-none");
      } else {
        this.resultsTarget.classList.remove("d-none");
        this.formTarget.requestSubmit()
      }
    }, 500);
  }

  // displayResults() {
  //   if (this.inputTarget.value === "") {
  //     this.resultsTarget.classList.remove("d-none")
  //   }
  //   else {
  //     this.resultsTarget.classList.remove("d-none")
  //   }
  // }
  // hideResults() {
  //   this.resultsTarget.classList.add("d-none")
  // }
}
