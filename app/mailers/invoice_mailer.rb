class InvoiceMailer < ApplicationMailer
    default from: 'mahfuzflamedestiny@gmail.com'
    def invoice_email
        @patient = params[:patient]
        attachments['invoice.pdf'] = { :mime_type => 'application/pdf', :content => params[:invoice].render }
        mail(to: @patient.email, subject: 'Invoice of fee payment')
    end
end
