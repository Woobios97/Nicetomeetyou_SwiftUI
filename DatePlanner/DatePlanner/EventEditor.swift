//
//  EventEditor.swift
//  DatePlanner
//
//  Created by woosub kim  on 1/24/24.
//

import SwiftUI

struct EventEditor: View {
    @Binding var event: Event
    var isNew = false
    
    @State private var isDeleted = false
    @EnvironmentObject var eventData: EventData
    @Environment(\.dismiss) private var dismiss
    
    // 수정할 경우를 대비하여 로컬 사본을 보관하여 이벤트 목록을 방해하지 않도록 합니다.
    // 날짜가 변경되어 이벤트가 다른 섹션에 배치될 때 유용합니다.
    @State private var eventCopy = Event()
    @State private var isEditing = false
    
    private var isEventDeleted: Bool {
        !eventData.exists(event) && !isNew
    }
    
    var body: some View {
        VStack {
            EventDetail(event: $eventCopy, isEditing: isNew ? true : isEditing)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        if isNew {
                            Button("Cancel") {
                                dismiss()
                            }
                        }
                    }
                    ToolbarItem {
                        Button {
                            if isNew {
                                eventData.events.append(eventCopy)
                                dismiss()
                            } else {
                                if isEditing && !isDeleted {
                                    print("완료, 어떠한 변화인지 저장하세요 \(event.title).")
                                    withAnimation {
                                        event = eventCopy
                                        // 편집 내용(있는 경우)을 스토어에 다시 넣습니다.
                                    }
                                }
                                isEditing.toggle()
                            }
                        } label: {
                            Text(isNew ? "Add" : (isEditing ? "Done" : "Edit"))
                        }
                    }
                }
                .onAppear {
                    eventCopy = event
                    // 수정할 경우를 대비해 복사본을 가져옵니다.
                }
                .disabled(isEventDeleted)
            
            if isEditing && !isNew {
                Button(role: .destructive, action: {
                    isDeleted = true
                    dismiss()
                    eventData.delete(event)
                }, label: {
                    Label("이벤트 삭제", systemImage: "trash.circle.fill")
                        .font(.title2)
                        .foregroundColor(.red)
                })
                .padding()
            }
        }
        .overlay(alignment: .center) {
            if isEventDeleted {
                Color(UIColor.systemBackground)
                Text("이벤트가 삭제되었습니다. 이벤트를 다시 고르세요")
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    EventEditor(event: .constant(Event()))
}
