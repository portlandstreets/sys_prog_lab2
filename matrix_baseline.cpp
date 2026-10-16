#include <vector>
#include <random>
#include <iostream>

const int N = 1024;

void init_matrix(std::vector<float>& A) {
    for (int i = 0; i < N * N; ++i) A[i] = static_cast<float>(rand() % 100) / 10.0f;
}

void multiply_baseline(const std::vector<float>& A, const std::vector<float>& B, std::vector<float>& C) {
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            float sum = 0.0f;
            for (int k = 0; k < N; ++k) {
                sum += A[i * N + k] * B[k * N + j];
            }
            C[i * N + j] = sum;
        }
    }
}

int main() {
    std::vector<float> A(N * N), B(N * N), C(N * N, 0.0f);
    init_matrix(A);
    init_matrix(B);
    multiply_baseline(A, B, C);
    std::cout << "Done baseline. Result check: " << C[0] << std::endl;
    return 0;
}