package MedicalExam::Model::Common;


use strict;
use warnings;

use parent qw/MedicalExam::Model::Base/;
use Digest::SHA qw/hmac_sha256_hex/;
use MedicalExam::Common;

# TODO implement more strictly
sub enc_password {
    my ($self, $password) = @_;
    my $secret = MedicalExam::Common->get_key_vault('register_secret');
    return hmac_sha256_hex($password . $secret);
}

1;

