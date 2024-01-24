//
//  EventData.swift
//  DatePlanner
//
//  Created by woosub kim  on 1/24/24.
//

import SwiftUI

class EventData: ObservableObject {
    @Published var events: [Event] = [
        Event(symbol: "gift.fill",
              color: .red,
              title: "Maya's Birthday",
              tasks: [EventTask(text: "Guava kombucha"),
                      EventTask(text: "Paper cups and plates"),
                      EventTask(text: "Cheese plate"),
                      EventTask(text: "Party poppers"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 30)),
        Event(symbol: "theatermasks.fill",
              color: .yellow,
              title: "Pagliacci",
              tasks: [EventTask(text: "Buy new tux"),
                      EventTask(text: "Get tickets"),
                      EventTask(text: "Pick up Carmen at the airport and bring her to the show"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 22)),
        Event(symbol: "facemask.fill",
              color: .indigo,
              title: "Doctor's Appointment",
              tasks: [EventTask(text: "Bring medical ID"),
                      EventTask(text: "Record heart rate data"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 4)),
        Event(symbol: "leaf.fill",
              color: .green,
              title: "Camping Trip",
              tasks: [EventTask(text: "Find a sleeping bag"),
                      EventTask(text: "Bug spray"),
                      EventTask(text: "Paper towels"),
                      EventTask(text: "Food for 4 meals"),
                      EventTask(text: "Straw hat"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 36)),
        Event(symbol: "gamecontroller.fill",
              color: .cyan,
              title: "Game Night",
              tasks: [EventTask(text: "Find a board game to bring"),
                      EventTask(text: "Bring a desert to share"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 2)),
        Event(symbol: "graduationcap.fill",
              color: .primary,
              title: "First Day of School",
              tasks: [
                EventTask(text: "Notebooks"),
                EventTask(text: "Pencils"),
                EventTask(text: "Binder"),
                EventTask(text: "First day of school outfit"),
              ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 365)),
        Event(symbol: "book.fill",
              color: .purple,
              title: "Book Launch",
              tasks: [
                EventTask(text: "Finish first draft"),
                EventTask(text: "Send draft to editor"),
                EventTask(text: "Final read-through"),
              ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 365 * 2)),
        Event(symbol: "globe.americas.fill",
              color: .gray,
              title: "WWDC",
              tasks: [
                EventTask(text: "Watch Keynote"),
                EventTask(text: "Watch What's new in SwiftUI"),
                EventTask(text: "Go to DT developer labs"),
                EventTask(text: "Learn about Create ML"),
              ],
              date: Date.from(month: 6, day: 7, year: 2021)),
        Event(symbol: "case.fill",
              color: .orange,
              title: "Sayulita Trip",
              tasks: [
                EventTask(text: "Buy plane tickets"),
                EventTask(text: "Get a new bathing suit"),
                EventTask(text: "Find a hotel room"),
              ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 19)),
    ]
    
    /*
     Date.roundedHoursFromNow(60 * 60 * 24 * 19)는
     60 = 60초, 1분
     60 * 60 = 3600초, 1시간
     60 * 60 * 60 = 86400초, 1일
     60 * 60 * 24 * 19 = 1641600초, 19일
     */
    
    func delete(_ event: Event) {
        events.removeAll { $0.id == event.id }
    }
    
    func add(_ event: Event) {
        events.append(event)
    }
    
    func exists(_ event: Event) -> Bool {
        events.contains(event)
    }
    
    // sortedEvents라는 함수를 정의합니다. 이 함수는 Period 타입의 period 매개변수를 받고, Binding<[Event]> 타입의 결과를 반환합니다.
    func sortedEvents(period: Period) -> Binding<[Event]> {
        // Binding 객체를 생성합니다. 이 객체는 Event 배열에 대한 참조를 포함합니다.
        Binding<[Event]>(
            // get은 Binding 객체가 값을 필요로 할 때마다 호출됩니다. 이 클로저는 화면에 표시될 이벤트 목록을 결정합니다.
            get: {
                // self.events는 모든 이벤트를 포함하는 배열입니다. filter 메소드를 사용하여 이 배열에서 특정 조건을 만족하는 이벤트만 선택합니다.
                self.events
                // self.events는 모든 이벤트를 포함하는 배열입니다. filter 메소드를 사용하여 이 배열에서 특정 조건을 만족하는 이벤트만 선택합니다.
                    .filter {
                        // switch 문을 사용하여 사용자가 선택한 기간(period)에 따라 다른 필터링 기준을 적용합니다.
                        switch period {
                            // 만약 period가 .nextSevenDays인 경우, 다음 7일 이내의 이벤트만 선택합니다.
                        case .nextSevenDays:
                            return $0.isWithinSevenDays
                            // .nextThirtyDays인 경우, 7일 이후부터 30일 이내의 이벤트만 선택합니다.
                        case .nextThirtyDays:
                            return $0.isWithinSevenToThirtyDays
                            // .future인 경우, 먼 미래의 이벤트만 선택합니다.
                        case .future:
                            return $0.isDistant
                            // .past인 경우, 과거의 이벤트만 선택합니다.
                        case .past:
                            return $0.isPast
                        }
                    }
                // 필터링된 이벤트들을 날짜 순으로 정렬합니다.
                    .sorted { $0.date < $1.date }
            },
            // set은 Binding을 통해 이벤트 목록이 변경될 때 호출됩니다.
            set: { events in
                for event in events {
                    // 변경된 이벤트 목록을 순회합니다.
                    if let index = self.events.firstIndex(where: { $0.id == event.id }) {
                        self.events[index] = event
                    }
                }
            }
        )
    }
}

enum Period: String, CaseIterable, Identifiable {
    case nextSevenDays = "Next 7 Days"
    case nextThirtyDays = "Next 30 Days"
    case future = "Future"
    case past = "Past"
    
    var id: String { self.rawValue }
    var name: String { self.rawValue }
}


extension Date {
    
    /// 주어진 월(Month), 일(day), 년(year)을 바탕으로 'Date' 객체를 생성한다.
    static func from(month: Int, day: Int, year: Int) -> Date {
        /// 'DateComponents' 를 사용하여 날짜 구성 요소를 설정한다.
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        /// 그레고리안 캘린더에 해당하는 Data객체를 생성한다.
        let calendar = Calendar(identifier: .gregorian)
        /// calendar.date(from: dateComponents)는 변수 dateComponents의 구성요소를 바탕으로 Date 객체를 생성한다.
        if let date = calendar.date(from: dateComponents) {
            return date
        } else {
            /// 현재 날짜를 반환한다.
            return Date()
        }
    }
    
    static func roundedHoursFromNow(_ hours: Double) -> Date {
        /// 현재 시간으로부터 주어진 시간이 경과한 날짜를 계산한다.
        let exactDate = Date(timeIntervalSinceNow: hours)
        /// 해당 날짜가 포함된 시(hour)의 전체 범위를 찾는다.
        guard let hourRange = Calendar.current.dateInterval(of: .hour, for: exactDate) else {
            return exactDate
        }
        /// 1. 이 시간 범위의 끝('hourRange.end')을 반환한다. 이는 해당 시간대의 마지막 순간(즉, 시간이 끝나는 순간)을 나타낸다.
        /// 2. hourRange를 계산할 수 없다면, 정확한 계산된 날짜('exactDate')를 그대로 반환한다.
        return hourRange.end
    }
    
}
