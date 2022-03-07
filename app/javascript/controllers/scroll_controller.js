import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  /** On start */
  connect() {
    console.log("Connected")
    const messages = document.getElementById("messages");
    messages.addEventListener("DOMNodeInserted", this.resetScroll)
    this.resetScroll(messages);
  }

  /** On stop */
  disconnect() {
    if (document.getElementById("messages")) {
      console.log("Disconnected")
      document.getElementById("messages").removeEventListener
    }
  }

  /** Custom function */
  resetScroll() {
    messages.scrollTop = messages.scrollHeight - messages.clientHeight
  }
}
