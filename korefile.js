var solution = new Solution('Empty');
var project = new Project('Empty');
project.setDebugDir('build/linux');
project.addSubProject(Solution.createProject('build/linux-build'));
project.addSubProject(Solution.createProject('/home/nate/Empty/Kha'));
project.addSubProject(Solution.createProject('/home/nate/Empty/Kha/Kore'));
solution.addProject(project);
if (fs.existsSync(path.join('Libraries/libdrp', 'korefile.js'))) {
	project.addSubProject(Solution.createProject('Libraries/libdrp'));
}
return solution;
