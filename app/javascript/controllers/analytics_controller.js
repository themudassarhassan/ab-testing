import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.#track('page_view')
  }
  
  trackSignup() {
    this.#track('signup')
  }
  
  #track(event_type) {
    const reqBody = {
      event_type: event_type
    };
    
    fetch(this.#url, {
      method: 'POST',
      body: JSON.stringify(reqBody),
      headers: {
        "Content-Type": "application/json",
      }
    })
  }
  
  get #url() {
    return `${location.origin}/analytics`;
  }
}
