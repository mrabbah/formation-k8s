import http from 'k6/http';
import { check, sleep } from 'k6';
export const options = {
  stages: [
    { duration: '10s', target: 20 },
    { duration: '20s', target: 150 },
    { duration: '60s', target: 300 },
    { duration: '20s', target: 150 },
    { duration: '20s', target: 20 },
    { duration: '10s', target: 0 },
  ]
};
export default function () {
  const res = http.get('http://localhost:30000/');
  check(res, { 'status was 200': (r) => r.status == 200 });
  sleep(0.5);
}
