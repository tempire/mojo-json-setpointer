requires 'perl', '5.34.0';

requires 'Mojolicious';
requires 'Devel::Dwarn';

on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'App::RewriteVersion';
    requires 'Minilla';
    requires 'Carton';
};
