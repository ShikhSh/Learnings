#include <iostream>
using namespace std;

void swap(int arr[], int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
}
void heapify(int arr[], int N, int i) {
    int largest = i;
    int l = 2 * i + 1; // left = 2*i + 1
    int r = 2 * i + 2; // right = 2*i + 2

    if (l < N && arr[l] > arr[largest])
        largest = l;
 
    if (r < N && arr[r] > arr[largest])
        largest = r;

    if (largest != i) {
        swap(arr, i, largest);
        heapify(arr, N, largest);
    }
}
void heapSort(int arr[], int N) {
     for (int i = N / 2 - 1; i >= 0; i--)
        heapify(arr, N, i);
 
    for (int i = N - 1; i > 0; i--) {
        swap(arr, 0, i); 
        heapify(arr, i, 0);
    }
}
 
// A utility function to print array of size n
void printArray(int arr[], int N) {
    for (int i = 0; i < N; ++i)
        cout << arr[i] << " ";
    cout << "\n";
}

int putPivotInPlace(int arr[], int st, int end) {
    int pivot_ele = arr[end];
    int l = st;
    int r = end-1;
    while(l<r) {
        while(l<=r && arr[l]<=pivot_ele) {
            l++;
        }
        while(l<=r && pivot_ele<=arr[r]) {
            r--;
        }
        if(l<=r) {
            swap(arr, l, r);
        }
    }
    swap(arr, l, end);
    return l;
}

void quickSort(int arr[], int N, int st, int end) {
    if(st>=end) {
        return;
    }
    int pivot = putPivotInPlace(arr, st, end);    
    quickSort(arr, N, st, pivot-1);
    quickSort(arr, N, pivot+1, end);
}

// Driver's code
int main()
{
    int arr[] = { 12, 11, 13, 6, 5, 4 };
    int N = sizeof(arr) / sizeof(arr[0]);
 
    // Function call
    // heapSort(arr, N);
    quickSort(arr, N, 0, N-1);
 
    cout << "Sorted array is \n";
    printArray(arr, N);
}
