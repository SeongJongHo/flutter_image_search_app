enum SortCategory {
  newest('최신순'),
  oldest('오래된순'),
  popularity('인기순');

  final String value;

  const SortCategory(this.value);

  static SortCategory fromString(String value) {
    return switch (value) {
      '최신순' => SortCategory.newest,
      '오래된순' => SortCategory.oldest,
      '인기순' => SortCategory.popularity,
      _ => SortCategory.newest,
    };
  }
}
