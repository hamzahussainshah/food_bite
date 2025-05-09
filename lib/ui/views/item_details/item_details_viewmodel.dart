import 'package:food_bite/ui/common/assets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class ItemDetailsViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  String selectedSize = "M"; // Default size
  List<String> selectedAddOns = [
    "Mozzarella",
    "Pepperoni"
  ]; // Default selected add-ons
  bool isFavorite = false; // Favorite state
  bool showReviews = false; // Toggle for showing reviews

  // Sample list of reviews with an additional index for tracking
  List<Map<String, dynamic>> reviews = [
    {
      "userName": "Sophia M",
      "timestamp": "Today, 16:40",
      "rating": 5,
      "comment":
          "Absolutely delicious! The crust is perfectly crispy, and the fresh mozzarella melts beautifully. This is my go to pizza every time!",
      "likes": 68,
      "images": [],
    },
    {
      "userName": "Emma",
      "timestamp": "Today, 09:12",
      "rating": 5,
      "comment":
          "Loved the balance of flavors! The basil adds a nice freshness, and the tomato sauce is rich and tangy. Could use a bit more cheese, but still amazing!",
      "likes": 132,
      "images": [
        AppImages.burger1,
        AppImages.burger2,
        AppImages.burger2,
        AppImages.burger1,
      ],
    },
    {
      "userName": "Sophia M",
      "timestamp": "Today, 16:40",
      "rating": 5,
      "comment":
          "Absolutely delicious! The crust is perfectly crispy, and the fresh mozzarella melts beautifully. This is my go to pizza every time!",
      "likes": 68,
      "images": [],
    },
  ];

  // Track which reviews the user has liked (by index)
  List<int> userLikedReviews = [];

  void selectSize(String size) {
    selectedSize = size;
    notifyListeners();
  }

  void toggleAddOn(String addOn) {
    if (selectedAddOns.contains(addOn)) {
      selectedAddOns.remove(addOn);
    } else {
      selectedAddOns.add(addOn);
    }
    notifyListeners();
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void toggleReviews() {
    showReviews = !showReviews;
    notifyListeners();
  }

  void toggleLike(int reviewIndex) {
    if (userLikedReviews.contains(reviewIndex)) {
      // Unlike the review
      userLikedReviews.remove(reviewIndex);
      reviews[reviewIndex]["likes"] =
          (reviews[reviewIndex]["likes"] as int) - 1;
    } else {
      // Like the review
      userLikedReviews.add(reviewIndex);
      reviews[reviewIndex]["likes"] =
          (reviews[reviewIndex]["likes"] as int) + 1;
    }
    notifyListeners();
  }

  void addToCart() {
    // Handle add to cart logic
    print("Added to cart: Size: $selectedSize, Add-ons: $selectedAddOns");
  }

  void navigateBack() {
    _navigationService.back();
  }
}
