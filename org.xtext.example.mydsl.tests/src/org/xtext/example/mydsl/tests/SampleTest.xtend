package org.xtext.example.mydsl.tests

import jakarta.inject.Inject
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.junit.Test
import org.junit.runner.RunWith
import org.xtext.example.mydsl.MyDslInjectorProvider
import org.xtext.example.mydsl.myDsl.Model

import static org.junit.Assert.*


@RunWith(XtextRunner)
@InjectWith(MyDslInjectorProvider)
class SampleTest {
	
	@Inject
	extension ParseHelper<Model>
	
	@Test
	def void testIt() {
		val model = '''
		Hello A!
		Hello B!
		'''.parse
		assertEquals(0, model.eResource.errors.size)
	}
	
	@Test
	def void testItNeg() {
		val model = '''
		Hello A
		'''.parse
		assertEquals(1, model.eResource.errors.size)
	}
	
}