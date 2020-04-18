function [succ, delay] = ping(host)

headstr = 'ping -o -t 3';
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
