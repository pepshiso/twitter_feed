#! /usr/bin/perl
use strict;
use warnings;
use autodie;
use XML::Simple;
use HTTP::Lite;

if (@ARGV != 1) {
    die "usage: perl twitter_feed.pl [username]\n";
}
my $username = $ARGV[0];

my $http = HTTP::Lite->new;
my $req = $http->request("http://twitter.com/users/$username");
my $id = XML::Simple->new->XMLin($http->body)->{'id'};

print "tweets: http://twitter.com/statuses/user_timeline/$id.rss\n";
print "favorites: http://twitter.com/favorites/$id.rss\n";
