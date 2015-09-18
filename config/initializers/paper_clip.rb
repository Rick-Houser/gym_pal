    Paperclip::Attachment.default_options.merge!(
        :url => ':s3_domain_url',
        :path => 'app/public/:class/:attachment/:id_partition/:style/:filename'
    )