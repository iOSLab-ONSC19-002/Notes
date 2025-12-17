//
//  NoteEntityCard.swift
//  Notes
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 17/12/25.
//

import SwiftUI

struct NoteEntityCard: View {
	
	let note: NoteEntity
	
	let dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "dd/MM/yyyy"
		return formatter
	}()
	
	var body: some View {
		VStack(alignment: .leading) {
			HStack(alignment: .top) {
				Text("Título: \(note.title ?? "Título da nota")")
					.font(.title2)
					.bold()
				
				Spacer()
				
				Text("Data: \(dateFormatter.string(from: note.date ?? Date.now))")
					.font(.callout)
					.foregroundStyle(.secondary)
			}
			
			Divider()
			
			Text(note.body ?? "Corpo da nota")
				.font(.body)
				.padding(.top, 5)
		}
		.padding()
		.background(
			RoundedRectangle(cornerRadius: 16)
				.foregroundStyle(.secondary.opacity(0.3))
				.shadow(radius: 2)
		)
		.padding()
	}
}

//#Preview {
//	NoteEntityCard()
//}
