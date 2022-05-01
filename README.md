# Demo_Combine
[Swift] Combine 을 이해하기

# Subject
### 외부에서 값을 대입할 수 있는 Publisher 프로토콜
### send 메소드를 통해 stream 에 값을 대입
### PassthroughSubject, CurrentValueSubject 기본으로 제공

[PassthroughSubject]
- 초기값이 없음
- 직전에 방출한 값을 저장하지 않음

let subject = PassthroughSubject<String, Never>()
subject.send("A")
// A
subject.send("B") 
// B
subject.send(completion: .finished)
// finished 

[CurrentValueSubject]
- 초기값이 있음
- 직전에 방출한 값을 저장함

let subject = CurrentValueSubject<String, Never>("A")
// A
subject.send("B")
// B
subject.send("C")
// C
subject.send(.finished)
// finished


