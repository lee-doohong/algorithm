package test;

import java.util.*;
import java.io.*;

public class MainClass {
	static int N;
	static int M;
	static int[] mArr;
	static int[] cArr;
	static Integer[][] dp;//dp[i][j]라고 했을때, mArr[i]까지 프로그램을 살펴보고, 필요한 메모리가 j일때 최소 비활성화 메모리의 값  
	public static void main(String[] args) throws IOException {
//목표 : mArr값이 N을 만족 시켰을때, cArr값의 최솟값을 찾는 것		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		
		int[] tmpArr = Arrays.stream(br.readLine().split(" ")).mapToInt(Integer::parseInt).toArray();
		
		N = tmpArr[0];
		M = tmpArr[1];//필요한 메모리
		
		dp = new Integer[N + 1][M + 1];//i = 0과 j = 0은 비워둔다.
		
		for (int i = 0; i < N+1; i++) {
			for (int j = 0; j < M+1; j++) {
				dp[i][j] = Integer.MAX_VALUE;
			}
		}
		
		mArr = Arrays.stream(br.readLine().split(" ")).mapToInt(Integer::parseInt).toArray();
		cArr = Arrays.stream(br.readLine().split(" ")).mapToInt(Integer::parseInt).toArray();
		
//		System.out.println("N : " + N + ", M : " + M + ", mArr : " + Arrays.toString(mArr) + ", cArr : " + Arrays.toString(cArr));
//		점화식 dp[i][j] = Math.min(dp[i - 1][j], dp[i - 1][j - mArr[i]] + cArr[i]);
//		뭐라도 하나 취소시켜야 되지 않나?//최솟값을 넣어줘야 하나?
		recur(N, M);
				
	}
	public static int recur(int n, int m) {
		if (dp[n][m] != null) return dp[n][m];
		
		for (int i = 1; i <= N; i++ ) {//몇번째 프로그램까지 탐색할 건지
			for (int j = 1 ; j <= M; j++) {//활성 메모리가 얼마인건지
				if (j - mArr[i - 1] >= 0) {
					dp[i][j] = Math.min(dp[i - 1][j], dp[i - 1][j - mArr[i - 1]] + cArr[i - 1]);
				}
			}
		}
		
	}
}
