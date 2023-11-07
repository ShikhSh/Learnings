#include <iostream>
using namespace std;

void swap(int arr[], int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
}
void printArray(int arr[], int N) {
    for (int i = 0; i < N; ++i)
        cout << arr[i] << " ";
    cout << "\n";
}
/***********************
Heap sort
*************************/
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

/***********************
Quick sort
*************************/
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
/***********************
Merge sort
*************************/
void merge(int arr[], int st, int mid, int end) {
    int l1 = mid-st+1;
    int l2 = end-mid;
    int arr1[l1];
    int arr2[l2];
    int ptr = st;
    int p1 = 0;
    while (p1<l1) {
        arr1[p1] = arr[ptr];
        p1++;
        ptr++;
    }
    int p2 = 0;
    while(p2<l2) {
        arr2[p2] = arr[ptr];
        p2++;
        ptr++;
    }
    
    p1 = 0;
    p2 = 0;
    ptr = st;
    while(p1<l1 && p2<l2) {
        if(arr1[p1]<=arr2[p2]) {
            arr[ptr] = arr1[p1];
            p1++;
            ptr++;
        } else {
            arr[ptr] = arr2[p2];
            p2++;
            ptr++;
        }
    }
    
    while(p1<l1) {
        arr[ptr] = arr1[p1];
        p1++;
        ptr++;
    }
    while(p2<l2) {
        arr[ptr] = arr2[p2];
        p2++;
        ptr++;
    }
}
void mergeSort(int arr[], int st, int end) {
    if(st>=end) {
        return;
    }
    
    int mid = (st+end)/2;
    mergeSort(arr, st, mid);
    mergeSort(arr, mid+1, end);
    
    merge(arr, st, mid, end);
}

/***********************
Bottoms-up merge sort
*************************/
void merge(int arr[], int st1, int end1, int st2, int end2) {
    int l1 = end1-st1+1;
    int l2 = end2-st2+1;
    int arr1[l1];
    int arr2[l2];
    int ptr = st1;
    int p1 = 0;
    while (p1<l1) {
        arr1[p1] = arr[ptr];
        p1++;
        ptr++;
    }
    int p2 = 0;
    while(p2<l2) {
        arr2[p2] = arr[ptr];
        p2++;
        ptr++;
    }
    
    p1 = 0;
    p2 = 0;
    ptr = st1;
    while(p1<l1 && p2<l2) {
        if(arr1[p1]<=arr2[p2]) {
            arr[ptr] = arr1[p1];
            p1++;
            ptr++;
        } else {
            arr[ptr] = arr2[p2];
            p2++;
            ptr++;
        }
    }
    
    while(p1<l1) {
        arr[ptr] = arr1[p1];
        p1++;
        ptr++;
    }
    while(p2<l2) {
        arr[ptr] = arr2[p2];
        p2++;
        ptr++;
    }
}
// Bottom-up merge sort
void iterativeMergeSort(int arr[], int N) {
    int i = 0;
    int merged_arr_len = pow(2, i);
    while(merged_arr_len<N) {
        for(int j = 0; j<N; j+=2*merged_arr_len) {
            int st1 = j;
            int st2 = j+merged_arr_len;
            if(st2>=N) break;
            int end1 = st2-1;
            int end2 = st2+merged_arr_len-1;
            if (end2>=N) {
                end2 = N-1;
            }
            merge(arr, st1, end1, st2, end2);
        }
        printArray(arr, N);
        i++;
        merged_arr_len = pow(2, i);
    }
    
}

// Driver's code
int main()
{
    int arr[] = { 12, 11, 13, 6, 5, 4, 4 };
    int N = sizeof(arr) / sizeof(arr[0]);
 
    // Function call
    // heapSort(arr, N);
    // quickSort(arr, N, 0, N-1);
    // mergeSort(arr,0,N-1);
    iterativeMergeSort(arr, N);
 
    cout << "Sorted array is \n";
    printArray(arr, N);
}
