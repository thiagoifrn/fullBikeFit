class SetupBike {
  final String? saddleHeight;
  final String? saddleGap;
  final String? saddleRecoil;
  final String? saddleGapgAuntlets;
  final String? saddleReachgAuntlets;
  final String? reachgAuntlets;
  final String? stackAuntlets;

  SetupBike(
      {this.saddleHeight,
      this.saddleGap,
      this.saddleRecoil,
      this.saddleGapgAuntlets,
      this.saddleReachgAuntlets,
      this.reachgAuntlets,
      this.stackAuntlets});

  SetupBike copyWith({
    String? saddleHeight,
    String? saddleGap,
    String? saddleRecoil,
    String? saddleGapgAuntlets,
    String? saddleReachgAuntlets,
    String? reachgAuntlets,
    String? stackAuntlets,
  }) {
    return SetupBike(
      saddleHeight: saddleHeight ?? this.saddleHeight,
      saddleGap: saddleGap ?? this.saddleGap,
      saddleRecoil: saddleRecoil ?? this.saddleRecoil,
      saddleGapgAuntlets: saddleGapgAuntlets ?? this.saddleGapgAuntlets,
      saddleReachgAuntlets: saddleReachgAuntlets ?? this.saddleReachgAuntlets,
      reachgAuntlets: reachgAuntlets ?? this.reachgAuntlets,
      stackAuntlets: stackAuntlets ?? this.stackAuntlets,
    );
  }

  @override
  String toString() {
    return 'SetupBike(saddleHeight: $saddleHeight, saddleGap: $saddleGap, saddleRecoil: $saddleRecoil, saddleGapgAuntlets: $saddleGapgAuntlets, saddleReachgAuntlets: $saddleReachgAuntlets, reachgAuntlets: $reachgAuntlets, stackAuntlets: $stackAuntlets)';
  }
}
