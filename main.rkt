#lang at-exp racket

(require website-js
	 (prefix-in html: (only-in website script)))

(define mode (make-parameter 'live))

(define (stripe-price)
  (if (eq? (mode) 'test) 
      "learntomodsubscription_2_1year_29.99"
      "learntomod(1-year)_2_1year_29.99"))

(define (stripe-key)
  (if (eq? (mode) 'test) 
      "pk_test_TI5kNWFmWEn7pNgnFl7HkHxW"
      "pk_live_MmLDMcIYCNUlexcExwZ0sHdM"))

(define (buy-button)
  (enclose 
    (div
      (button
	style: "background-color:#6772E5;color:#FFF;padding:8px 12px;border:0;border-radius:4px;font-size:1em"
	id: "checkout-button-learntomod(1-year)_2_1year_29.99"
	role: "link"
	"Checkout")
      (div id: "error-message"))

    (script ([dummy
	       @js{
	       (function() {
			   var stripe = Stripe('@(stripe-key)'.trim());

			   var checkoutButton = document.getElementById('checkout-button-learntomod(1-year)_2_1year_29.99');
			   checkoutButton.addEventListener('click', function () {
							   // When the customer clicks on the button, redirect
							   // them to Checkout.
							   stripe.redirectToCheckout({
										      lineItems: [{price: '@(stripe-price)'.trim(), quantity: 1}],
										      mode: 'subscription',
										      // Do not rely on the redirect to the successUrl for fulfilling
										      // purchases, customers may not always reach the success_url after
										      // a successful payment.
										      // Instead use one of the strategies described in
										      // https://stripe.com/docs/payments/checkout/fulfillment
										      successUrl: 'https://www.learntomod.com/success',
										      cancelUrl: 'https://www.learntomod.com/canceled',
										      })
							   .then(function (result) {
									  if (result.error) {
									  // If `redirectToCheckout` fails due to a browser or network
									  // error, display the localized error message to your customer.
									  var displayError = document.getElementById('error-message');
									  displayError.textContent = result.error.message;
									  }
									  });
							   });
			   })();
	       }
	       ]))))

(define (page-header . content)
  (div id: "page-header" 
       (div class: "container cf"
	    content )))

(define (main . content)
  (div id: "main" class: "gray page"
       (div class: "container cf"
	    content )))

(define (ltm-nav)
  @html/inline{
    @~a{
  	<header id="header" class="cf">
		<a href="index.html" id="logo"><img src="wp-content/themes/learntomod/images/logo.svg" alt="LearnToMod" /></a>
		<nav>
			<a href="index.html#" id="mobile-menu"><i class="icons8-menu"></i></a>
			<ul id="menu-main-menu" class="menu"><li id="menu-item-617" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-617"><a>Product</a>
<ul class="sub-menu">
	<li id="menu-item-612" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-612"><a href="index.html@"@"p=15.html">Features</a></li>
	<li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-765"><a href="features/index.html#pricing">Pricing</a></li>
	<li id="menu-item-1714" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1714"><a href="index.html@"@"p=1545.html">Online Courses</a></li>
</ul>
</li>
<li id="menu-item-471" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-471"><a>Parents &#038; Educators</a>
<ul class="sub-menu">
	<li id="menu-item-93" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-93"><a href="index.html@"@"p=87.html">Parents</a></li>
	<li id="menu-item-107" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-107"><a href="index.html@"@"p=104.html">Educators</a></li>
</ul>
</li>
<li id="menu-item-472" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-472"><a>Community</a>
<ul class="sub-menu">
	<li id="menu-item-157" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-157"><a href="http://forum.learntomod.com/">Official LearnToMod Forum <i class="icons8-external-link"></i></a></li>
	<li id="menu-item-156" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-156"><a href="blog/index.html">Blog</a></li>
</ul>
</li>
<li id="menu-item-618" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-618"><a>Our Company</a>
<ul class="sub-menu">
	<li id="menu-item-26" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-26"><a href="index.html@"@"p=6.html">About Us</a></li>
	<li id="menu-item-158" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-158"><a href="about/index.html#block2">Our Team</a></li>
	<li id="menu-item-770" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-770"><a href="index.html@"@"p=767.html">Sponsors &#038; Partners</a></li>
</ul>
</li>
<li id="menu-item-473" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-473"><a>Support</a>
<ul class="sub-menu">
	<li id="menu-item-165" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-165"><a href="index.html@"@"p=160.html">FAQ</a></li>
	<li id="menu-item-164" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-164"><a href="index.html@"@"p=162.html">Contact Us</a></li>
</ul>
</li>
<li id="menu-item-32" class="divider account menu-item menu-item-type-custom menu-item-object-custom menu-item-32"><a href="https://mod.learntomod.com">Login</a></li>
<li id="menu-item-29" class="start menu-item menu-item-type-post_type menu-item-object-page menu-item-29"><a href="index.html@"@"p=24.html">Sign Up</a></li>
</ul>		</nav>
	</header>
 
  }}
  )

(define (pos)
  (page sign-up-2.html
        (content 
          #:head 
	  (list (include-css "wp-content/themes/learntomod/style.css")
		(html:script src: "https://js.stripe.com/v3/"))
	  (ltm-nav)
	  (page-header
	    (h1 "Start Modding Minecraft for $29.99!")
            (p "Hundreds of Minecraft Videos, Tutorial Lessons, and Badges."))
	  (main 
	    (p "After you purchase your recurring 1-yr LearnToMod subscription below, we’ll send you an access key by e-mail (to the email you enter below) with login instructions. Use your access key to create a new LearnToMod account, and start modding today!")
	    (p "To opt out of autorenewal, email contat@learntomod.com with your receipt at any time")
            (buy-button)))))

(render #:to "out"
	(list (pos)))
