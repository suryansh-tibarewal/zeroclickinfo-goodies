package DDG::Goodie::URLEncode;
# ABSTRACT: Displays the percent-encoded url.

use DDG::Goodie;
use URI::Encode qw(uri_encode);
use warnings;
use strict;

zci answer_type =>          'encoded_url';
primary_example_queries     'url encode http://nospaces.duckduckgo.com/hook em horns' , 'encode url xkcd.com/a webcomic of%romance+math+sarcasm+language';
secondary_example_queries   'http://arstechnica.com/spaces after end  url encode', 'apple.com/mac encode URL';
description                 'Displays the percent-encoded url';
name                        'URLEncode';
code_url                    'https://github.com/duckduckgo/zeroclickinfo-goodies/blob/master/lib/DDG/Goodie/URLEncode.pm';
category                    'computing_tools';
topics                      'programming', 'web_design';
attribution twitter =>      ['nshanmugham', 'Nishanth Shanmugham'],
            web     =>      ['http://nishanths.github.io', 'Nishanth Shanmugham'],
            github  =>      ['https://github.com/nishanths', 'Nishanth Shanmugham'];

triggers startend   =>      'url encode', 'encode url', 'urlencode', 'encodeurl', 'url escape', 'urlescape';

my $css = share("style.css")->slurp();
sub append_css {
    my $html = shift;
    return "<style type='text/css'>$css</style>\n" . $html;
};

handle remainder => sub {
    my $encoded_url = uri_encode($_);

    my $text = "Percent-encoded URL: $encoded_url";
    my $html = qq(<div class="zci--urlencode"><span class="label">Percent-encoded URL: <span class="url">$encoded_url</span></span></div>);
    $html = append_css($html);

    return $text, html => $html;
};

1;
