pragma circom 2.0.0;

template PowerCheck() {
    signal input amount;      // Private: 실제 발전량
    signal input threshold;   // Public: 최소 기준치
    signal output isValid;    // Public: 결과 (1 or 0)

    // amount > threshold 임을 확인하는 로직 (간단한 예시)
    // 실제 구현 시에는 범위 검증 컴포넌트를 사용합니다.
    component gt = GreaterThan(32);
    gt.in[0] <== amount;
    gt.in[1] <== threshold;

    isValid <== gt.out;
}

// GreaterThan 등 기초 컴포넌트는 circomlib에서 가져오거나 직접 구현합니다.
template GreaterThan(n) {
    signal input in[2];
    signal output out;
    // ... (범위 검증 로직)
}

component main {public [threshold]} = PowerCheck();
