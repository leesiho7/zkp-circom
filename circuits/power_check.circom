pragma circom 2.0.0;

include "node_modules/circomlib/circuits/poseidon.circom";

template PowerCheck() {
    // Private inputs (증명자만 아는 값)
    signal input amount;
    
    // Public inputs (검증자도 아는 값)
    signal input threshold;
    signal input merkleRoot; // 자바에서 넘겨받은 머클 루트

    // 1. 수치 검증 로직 (예: 발전량이 0보다 큰가?)
    component gt = GreaterThan(32);
    gt.in[0] <== amount;
    gt.in[1] <== threshold;
    gt.out === 1;

    // 2. 데이터 무결성 검증 (머클 루트와 매칭되는지 - 개념적)
    // 실제로는 여기서 Merkle Proof(Path)를 입력받아 해싱 후 merkleRoot와 비교해야 함
}

component main {public [threshold, merkleRoot]} = PowerCheck();
