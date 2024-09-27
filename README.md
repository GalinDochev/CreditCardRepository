Credit Card Scanner App
# Overview
The Credit Card Scanner App is a mobile application built using Flutter that allows users to scan and manage credit card details effortlessly. By leveraging the credit_card_scanner package, the app provides the capability to scan cards using a camera and also allows manual entry of card details. The app uses Bloc for state management, ensuring a clean separation of business logic and user interface.

# Features 
Card Scanning
Users can scan credit cards using their device's camera. The card number, expiration date, and other relevant information are automatically extracted and populated into the app’s form fields.

# Manual Card Input
The app also allows users to manually input cardholder name, card number, expiration date, and CVV if scanning is not feasible or if the scan fails.

# Real-Time Validation
As the user enters card details manually, the input fields are validated in real-time, ensuring the data is correctly formatted before submission.

# Credit Card Display
A responsive, dynamic UI widget displays the cardholder’s credit card details in a stylized manner, giving a realistic preview of the card on the screen.

# Error Handling
If there are any issues with input validation or scanning, the app provides informative error messages to guide the user in correcting the input.

# Auto-Fill After Scanning
Upon a successful scan, the app automatically populates the form fields with the scanned card details for user review and confirmation.

# Responsive Design
The app is optimized for a variety of screen sizes, making it suitable for use on both small and large devices.

Technologies & Packages
# Flutter
# Flutter Bloc
# credit_card_scanner (v1.0.5)
# Material UI
# Custom Widgets

## Usage

# Scanning Cards
Tap on the scan button to initiate the camera-based scanning feature. If the scan is successful, the card details will automatically populate the respective fields in the form.

# Manual Entry
Users can also manually input the cardholder’s name, card number, expiration date, and CVV if scanning is not possible.

# Submission
Once all fields are completed, the user can press the submit button to validate and process the card information.

Note: Ensure that the app has proper camera permissions enabled for the scanning feature to work correctly.

# Known Limitations

Third-Party Scanner Issues
The app relies on the credit_card_scanner package, which generally works well but has some limitations. In certain cases, the card scanner may fail to recognize or extract card details correctly, particularly if:

# Worn-Out Cards: Physically damaged or worn-out cards may not scan properly if the numbers or letters are not clearly visible.
# Blurred or Faded Information: Cards with blurred or faded numbers, letters, or logos due to wear and tear may not be detected by the scanner.
# Design-Specific Issues: Cards with unconventional designs, non-standard fonts, or reflective surfaces may be difficult for the scanner to read.
# If scanning fails, it is recommended to manually input the card details into the form fields. Future improvements in the scanning package or advances in image recognition might mitigate some of these issues.