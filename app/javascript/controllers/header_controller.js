import { Controller } from "@hotwired/stimulus"
import {enter, leave, toggle} from 'el-transition'

export default class extends Controller {
    
    static targets = [ "dropdown", "openUserMenu"]

    connect () {

        this.openUserMenuTarget.addEventListener("click", (e)=> {
            this.openDropdown()
        } )
    }

    openDropdown() {
        toggle(this.dropdownTarget).then( () => {
            console.log("Enter transition complete");
        })
    }

    closeDropdown() {
        leave(this.dropdownTarget).then( () => {
            element.destroy();
        })
    }
}