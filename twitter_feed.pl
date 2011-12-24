#! /usr/bin/perl
use strict;
use warnings;
use autodie;
use XML::LibXML;

if (@ARGV != 1) {
    die "usage: $0 [username]\n";
}

my $doc = XML::LibXML->load_xml(
    location => 'http://twitter.com/users/' . $ARGV[0]
    );
my $root = $doc->documentElement();

my ($id,) = $doc->getElementsByTagName('id');
$id = $id->textContent;
print 'tweets: ', 'http://twitter.com/statuses/user_timeline/',
    $id, ".rss\n";
print 'favorites: ', 'http://twitter.com/favorites/',
    $id, ".rss\n";
