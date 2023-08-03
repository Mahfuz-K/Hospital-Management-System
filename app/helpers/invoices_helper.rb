# frozen_string_literal: true

# this is a helper

# rubocop:disable all
require 'prawn'
require 'prawn/table'
# this is a pdf helper
module InvoicesHelper
  def invoice_pdf(invoice)
    Prawn::Document.new do |pdf|
      initial_y = pdf.cursor
      initialmove_y = 5
      address_x = 35
      invoice_header_x = 325
      lineheight_y = 12
      font_size = 9

      pdf.text 'Invoice', align: :center, size: 30
      pdf.stroke_horizontal_rule
      pdf.move_down initialmove_y

      # Add the font style and size
      pdf.font 'Helvetica'
      pdf.font_size font_size

      # Start with your school name and address
      pdf.text_box 'Hospital Invoice', at: [address_x, pdf.cursor], size: 16, align: :center

      last_measured_y = pdf.cursor
      pdf.move_cursor_to pdf.bounds.height

      pdf.move_cursor_to last_measured_y

      # invoice details
      pdf.move_down 65
      last_measured_y = pdf.cursor

      pdf.table(
        [
          ['Patient Name', invoice.patient.name],
          ['Amount', invoice.amount.to_i],
          ['Payment Type', invoice.payment_type.name]

        ],
        cell_style: { borders: [], padding: [2, 10, 2, 10] }
      ) do
        cells.borders = %i[bottom left right top]
        cells.border_width = 0.5
        cells.border_color = '000000'
      end

      pdf.move_cursor_to last_measured_y

      invoice_services_totals_data = [
        ['Total', "#{invoice[:amount]} INR"]

      ]

      pdf.table(invoice_services_totals_data, position: invoice_header_x, width: 215) do
        style(row(0..1).columns(0..1), padding: [1, 5, 1, 5], borders: [])
        style(row(0), font_style: :bold)
        style(row(2), background_color: 'e9e9e9', border_color: 'dddddd', font_style: :bold)
        style(column(1), align: :right)
      end
    end
  end
end


