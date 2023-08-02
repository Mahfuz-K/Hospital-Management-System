document.getElementById('voter_id_input').addEventListener('change', function() {
    const input = this;
    const label = input.nextElementSibling;
    const fileName = input.files[0]?.name;
    label.innerText = fileName || 'Choose file(s)...';
  });
