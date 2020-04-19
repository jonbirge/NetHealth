function [succ, delay] = ping(host)
%PING MATLAB interface for UNIX ping command
%   Provides a MATLAB wrapper to the default ping command available in a
%   UNIX system. This will only work on Linux and Mac OS X.

headstr = 'ping -o -t 1';
cmdstr = [headstr, ' ', host];
[s, m] = unix(cmdstr);

if s == 0
  succ = true;
  c = regexp(m, 'time=(?<time>\d*\.\d*)', 'names');
  delay = str2double(c.time);
else
  succ = false;
  delay = NaN;
end
