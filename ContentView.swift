//
//  ContentView.swift
//  SwiftUIDay01Ex04
//
//  Created by 윤태한 on 2/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var words: [String] = ["사과","딸기","바나나"]   // 단어를 저장할 배열
    @State private var newWord: String = ""  // 새로 입력할 단어
    @State private var searchWord: String = "" // 검색할 단어
    @State private var wordToDelete: String = "" // 삭제할 단어
    @State private var message: String = "단어를 추가하세요"  // 상태 메시지

    func addWord() {
        if let index = words.firstIndex(of: newWord){
            newWord = ""
            message = "이미 존재하는 단어입니다."
        }else{
            words.append(newWord)
            print("추가 완료", newWord)
            newWord = ""
            message = "새 단어가 추가되었습니다."
            
        }
    }
    
    func wordSearch() {
        if let index = words.firstIndex(of: searchWord){
            message = "\(searchWord)은 배열의 \(index)번째 위치에 있습니다."
        }else{
            message = "존재하지 않는 단어입니다."
        }
    }
    
    func removeWord() {
        if let index = words.firstIndex(of: wordToDelete){
            words.remove(at: index)
            print("삭제 완료", wordToDelete)
            message = "단어 목록에서 \(wordToDelete)가 삭제되었습니다."
            wordToDelete = ""
        }else{
            message = "존재하지 않는 단어입니다."
        }
    }
    
    var body: some View {
        
        VStack {
            Text ("단어 관리 프로그램").font(.largeTitle)
                .padding()
            HStack {
                TextField("추가할 단어 입력", text: $newWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("추가") {
                    addWord()
                }
            }.padding()
            HStack {
                TextField("검색할 단어 입력", text: $searchWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("검색") {
                    wordSearch()
                }
            }.padding()
            Text("현재 단어 수: \(words.count)개")
            List(words, id: \.self) { word in
                Text(word)
            }
            HStack {
                TextField("삭제할 단어 입력", text: $wordToDelete)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("삭제") {
                    removeWord()
                }
            }.padding()
            Text(message)
                .foregroundStyle(.red)
                .padding()
        }
        .padding()
        
        
    }
}

struct ArrayManagerView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
