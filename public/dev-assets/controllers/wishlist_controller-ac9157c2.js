import { Controller } from "@hotwired/stimulus"

export default class extends Controller {


    static targets = ['icon', 'text'];
    
    updateWishlistStatus(e) { 
        e.preventDefault();
        
        const isUserLoggedIn = this.element.dataset.userLoggedIn;
    
        if(isUserLoggedIn === "false" ) {
            document.querySelector(".js-login").click();
            return 
        }

        if (this.element.dataset.status === "false") {

            const propertyId = this.element.dataset.propertyId;
            const userId = this.element.dataset.userId;

            console.log("Property ID:", propertyId);
            console.log("User ID:", userId);

            this.addPropertyToWishlist(propertyId, userId)
        } else {

            const wishlistId =this.element.dataset.wishlistId;
            this.removePropertyFromWishlist(wishlistId)
        }
        
    }

    addPropertyToWishlist(propertyId, userId) {
        const params = {
            property_id: propertyId,
            user_id: userId,
        };

        const options = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(params),
        };

        fetch( '/api/wishlists', options)
        .then(response => {

            if(!response.ok) {
                console.log(response.status);
            }
            return response.json();
        })
        .then(data => {
            this.element.dataset.wishlistId = data.id;
            this.element.dataset.status = "true";
            this.iconTarget.classList.remove("fill-none");
            this.iconTarget.classList.add("fill-[#FF5A5F]");

            if(this.textTarget) {
                this.textTarget.innerText = "Salvo"
            }
        })
        .catch(e => {
            console.log(e);
        });
    }

    removePropertyFromWishlist(wishlistId) {
        console.log("Removendo da wishlist, ID:", wishlistId);
        fetch('/api/wishlists/' + wishlistId, {
            method: 'DELETE',
        })
        .then(response => {
            this.element.dataset.wishlistId = '';
            this.element.dataset.status = "false";
            this.iconTarget.classList.remove("fill-[#FF5A5F]");
            this.iconTarget.classList.add("fill-none");

            if(this.textTarget) {
                this.textTarget.innerText = "Salvar"
            }
        })
        .catch(e => {
            console.log(e);
        });
    }
}