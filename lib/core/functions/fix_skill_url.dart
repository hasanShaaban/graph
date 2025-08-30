String fixSkillUrl(String url) {
  const String wrongPrefix = "http://127.0.0.1:8000";
  const String correctPrefix = "http://127.0.0.1:8000/storage/";

  if (url.startsWith(wrongPrefix) && !url.startsWith(correctPrefix)) {
    return url.replaceFirst(wrongPrefix, correctPrefix);
  }
  return url; // return unchanged if already correct
}
