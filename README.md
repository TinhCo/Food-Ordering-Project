# Food Ordering Project

1. **User:**
    - ID (Auto-generated)
    - Username
    - Password
    - Email
    - Phone Number
    - Address
    - Role (Customer or Restaurant Owner)
    - Registration Date
    - Last Login Date
2. **Restaurant:**
    - ID (Auto-generated)
    - Name
    - Description
    - Cuisine Type
    - Address
    - Contact Information
    - Opening Hours
    - Ratings
    - Image URL
    - Registration Date
3. **Menu Item:**
    - ID (Auto-generated)
    - Name
    - Description
    - Price
    - Category
    - Image URL
    - Availability Status
    - Restaurant (reference to Restaurant entity)
    - Creation Date
4. **Order:**
    - ID (Auto-generated)
    - Customer (reference to User entity)
    - Restaurant (reference to Restaurant entity)
    - Total Amount
    - Order Status
    - Timestamp
    - Delivery Address
    - Items (list of Order Items)
    - Payment (reference to Payment entity, if applicable)
5. **Order Item:**
    - ID (Auto-generated)
    - Menu Item (reference to Menu Item entity)
    - Quantity
    - Subtotal
    - Order (reference to Order entity)
6. **Payment:**
    - ID (Auto-generated)
    - Order (reference to Order entity)
    - Payment Method
    - Payment Status
    - Total Amount
    - Payment Timestamp
7. **~~Delivery Executive:~~**
    - ~~ID (Auto-generated)~~
    - ~~Name~~
    - ~~Contact Information~~
    - ~~Availability Status~~
    - ~~Current Location (Latitude and Longitude)~~
8. **Review/Rating:**
    - ID (Auto-generated)
    - Customer (reference to User entity)
    - Restaurant (reference to Restaurant entity)
    - Rating
    - Review Text
    - Timestamp
9. **Promotion/Coupon:**
    - ID (Auto-generated)
    - Code
    - Discount Amount
    - Validity Period
    - Terms and Conditions
10. **Notification:**
    - ID (Auto-generated)
    - Recipient (reference to User, Restaurant, or Delivery Executive entity)
    - Message
    - Timestamp
    - Read Status
11. **Category:**
    - ID (Auto-generated)
    - Name
12. **Address:**
    - ID (Auto-generated)
    - Street Address
    - City
    - State/Province
    - Postal Code
    - Country
    
13. contact information
    - email
    - mobile
    - twitter
    - instagram

**service**

**service-implementation**

**controller**
----------------------------------------------------------------------------

# Getting Started with Create React App

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

The page will reload when you make changes.\
You may also see any lint errors in the console.

### `npm test`

Launches the test runner in the interactive watch mode.\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can't go back!**

If you aren't satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you're on your own.

You don't have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn't feel obligated to use this feature. However we understand that this tool wouldn't be useful if you couldn't customize it when you are ready for it.

## Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

### Code Splitting

This section has moved here: [https://facebook.github.io/create-react-app/docs/code-splitting](https://facebook.github.io/create-react-app/docs/code-splitting)

### Analyzing the Bundle Size

This section has moved here: [https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size](https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size)

### Making a Progressive Web App

This section has moved here: [https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app](https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app)

### Advanced Configuration

This section has moved here: [https://facebook.github.io/create-react-app/docs/advanced-configuration](https://facebook.github.io/create-react-app/docs/advanced-configuration)

### Deployment

This section has moved here: [https://facebook.github.io/create-react-app/docs/deployment](https://facebook.github.io/create-react-app/docs/deployment)

### `npm run build` fails to minify

This section has moved here: [https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify](https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify)
