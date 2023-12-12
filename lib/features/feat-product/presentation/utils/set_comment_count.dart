int setCommentsCount(int totalItems) {
  if (totalItems > 1000) {
    return 999;
  }
  if (totalItems > 500) {
    return 499;
  }
  if (totalItems > 300) {
    return 299;
  }
  if (totalItems > 250) {
    return 249;
  }
  if (totalItems > 200) {
    return 199;
  }
  if (totalItems > 150) {
    return 149;
  }
  if (totalItems > 100) {
    return 99;
  }
  if (totalItems > 50) {
    return 49;
  }
  if (totalItems > 20) {
    return 19;
  }
  if (totalItems > 10) {
    return 9;
  } else {
    return totalItems;
  }
}
